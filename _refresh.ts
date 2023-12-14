import {spawn} from 'child_process';
import * as fs from 'fs';
import * as path from "path";
import * as request from 'request';

const script = process.argv[2];
const measurePath = 'bundles/measure';

function refresh() {
    return new Promise((resolve, reject) => {
        let proc;

        if (script === 'sh') {
            proc = spawn('bash', ['_refresh.sh']);
        } else if (script === 'bat') {
            proc = spawn('_refresh.bat');
        }

        proc.stdout.on('data', (data) => {
            console.log(data.toString());
        });
        proc.stderr.on('data', (data) => {
            console.error(data.toString());
        });
        proc.on('close', (code) => {
            console.log('Done refreshing with' + (code === 0 ? 'out error' : ' error'));
            if (code === 0) {
                resolve();
            } else {
                reject();
            }
        });
    });
}

function check() {
    if (!fs.existsSync(measurePath)) {
        console.log(`Measure path ${measurePath} doesn't exist`);
        return false;
    }

    console.log(`Performing checks on ${measurePath}`);

    const bundleFolders = fs.readdirSync(measurePath);

    for (let bundleId of bundleFolders) {
        const bundlePath = path.join(measurePath, bundleId, bundleId + '-bundle.json');
        let changed = false;

        if (!fs.existsSync(bundlePath)) {
            console.log(`Bundle path ${bundlePath} does not exist. Skipping.`);
            continue;
        }

        console.log(`Checking bundle ${bundleId}`);

        const bundleContent = fs.readFileSync(bundlePath).toString();
        const bundle = JSON.parse(bundleContent);

        if (bundle.id.endsWith('-bundle')) {
            console.log(`Fixing bundle id ${bundle.id} to exclude the "-bundle"`);
            bundle.id = bundle.id.substring(0, bundle.id.length - 7);
            changed = true;
        }

        bundle.entry
            .filter(e => e.resource.resourceType === 'Library' && !e.resource.status)
            .forEach(e => {
                console.log(`Library/${e.resource.id} does not have a status, defaulting to "active"`);
                e.resource.status = 'draft';
                changed = true;
            });

        const measureEntry = bundle.entry.find((e: any) => e.resource.resourceType === 'Measure' && e.resource.id === bundleId);
        const measure = measureEntry.resource;
        const libraryUrl = measure.library[0];
        const libraryEntry = bundle.entry.find((e: any) => e.resource.resourceType === 'Library' && e.resource.url === libraryUrl);
        const library = libraryEntry.resource;

        if (!library) {
            throw new Error(`Library ${libraryUrl} not found!`);
        }

        if (!library.dataRequirement) {
            console.log(`Library ${libraryUrl} doesn't have dataRequirement!`);
            return false;
        }

        if (changed) {
            console.log(`Bundle ${bundle.id} has changed. Saving updated bundle.`);
            fs.writeFileSync(bundlePath, JSON.stringify(bundle));
        }

        console.log(`Check for ${bundle.id} passed`);
    }

    return true;
}

async function putBundle(server, bundle) {
    console.log(`putting bundle ${bundle.id} on ${server}`);

    const url = server + (!server.endsWith('/') ? '/' : '') + 'Bundle/' + bundle.id;
    return new Promise((resolve, reject) => {
        request({
            method: 'PUT',
            url: url,
            body: bundle,
            json: true
        }, (err, response, body) => {
            if (err) {
                reject(err);
            } else {
                if (body.meta) {
                    console.log(`Successfully put ${bundle.id} on the server, now has version id ${body.meta.versionId}`);
                } else {
                    console.log(`Successfully put ${bundle.id} on the server`);
                }
                resolve(body);
            }
        });
    })
}

async function put() {
    const index = process.argv.indexOf('--put');

    if (index < 0) {
        console.log('Not putting bundle on server');
        return;
    } else if (index >= process.argv.length - 1) {
        throw new Error('--put does not specify the server to put it on');
    }

    const server = process.argv[index+1];

    const bundleFolders = fs.readdirSync(measurePath);

    for (let bundleId of bundleFolders) {
        const bundlePath = path.join(measurePath, bundleId, bundleId + '-bundle.json');
        const bundleContent = fs.readFileSync(bundlePath).toString();
        const bundle = JSON.parse(bundleContent);
        await putBundle(server, bundle);
    }
}

async function run() {
    await refresh();

    let checkCount = 0;
    while (!check()) {
        if (checkCount === 10) {
            throw new Error('Checked 10 times, without success. Stopping');
        }

        console.log(`Check ${checkCount} failed... re-refreshing`);
        await refresh();
        checkCount++;
    }

    console.log('Checks passed on the bundles');

    await put();
}

run()
    .then(() => {
        console.log('Done');
        process.exit(0);
    })
    .catch((err) => {
        console.error(err);
        process.exit(1);
    });