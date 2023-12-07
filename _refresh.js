"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __generator = (this && this.__generator) || function (thisArg, body) {
    var _ = { label: 0, sent: function() { if (t[0] & 1) throw t[1]; return t[1]; }, trys: [], ops: [] }, f, y, t, g;
    return g = { next: verb(0), "throw": verb(1), "return": verb(2) }, typeof Symbol === "function" && (g[Symbol.iterator] = function() { return this; }), g;
    function verb(n) { return function (v) { return step([n, v]); }; }
    function step(op) {
        if (f) throw new TypeError("Generator is already executing.");
        while (g && (g = 0, op[0] && (_ = 0)), _) try {
            if (f = 1, y && (t = op[0] & 2 ? y["return"] : op[0] ? y["throw"] || ((t = y["return"]) && t.call(y), 0) : y.next) && !(t = t.call(y, op[1])).done) return t;
            if (y = 0, t) op = [op[0] & 2, t.value];
            switch (op[0]) {
                case 0: case 1: t = op; break;
                case 4: _.label++; return { value: op[1], done: false };
                case 5: _.label++; y = op[1]; op = [0]; continue;
                case 7: op = _.ops.pop(); _.trys.pop(); continue;
                default:
                    if (!(t = _.trys, t = t.length > 0 && t[t.length - 1]) && (op[0] === 6 || op[0] === 2)) { _ = 0; continue; }
                    if (op[0] === 3 && (!t || (op[1] > t[0] && op[1] < t[3]))) { _.label = op[1]; break; }
                    if (op[0] === 6 && _.label < t[1]) { _.label = t[1]; t = op; break; }
                    if (t && _.label < t[2]) { _.label = t[2]; _.ops.push(op); break; }
                    if (t[2]) _.ops.pop();
                    _.trys.pop(); continue;
            }
            op = body.call(thisArg, _);
        } catch (e) { op = [6, e]; y = 0; } finally { f = t = 0; }
        if (op[0] & 5) throw op[1]; return { value: op[0] ? op[1] : void 0, done: true };
    }
};
Object.defineProperty(exports, "__esModule", { value: true });
var node_child_process_1 = require("node:child_process");
var fs = require("fs");
var path = require("path");
var request = require("request");
var refreshScript = process.argv[2];
var measurePath = 'bundles/measure';
function refresh() {
    return new Promise(function (resolve, reject) {
        var proc = (0, node_child_process_1.spawn)(refreshScript);
        proc.stdout.on('data', function (data) {
            console.log(data.toString());
        });
        proc.stderr.on('data', function (data) {
            console.error(data.toString());
        });
        proc.on('close', function (code) {
            console.log('Done refreshing with' + (code === 0 ? 'out error' : ' error'));
            if (code === 0) {
                resolve();
            }
            else {
                reject();
            }
        });
    });
}
function check() {
    if (!fs.existsSync(measurePath)) {
        return false;
    }
    var bundleFolders = fs.readdirSync(measurePath);
    var _loop_1 = function (bundleId) {
        var bundlePath = path.join(measurePath, bundleId, bundleId + '-bundle.json');
        var changed = false;
        if (!fs.existsSync(bundlePath)) {
            return "continue";
        }
        var bundleContent = fs.readFileSync(bundlePath).toString();
        var bundle = JSON.parse(bundleContent);
        if (bundle.id.endsWith('-bundle')) {
            console.log("Fixing bundle id ".concat(bundle.id, " to exclude the \"-bundle\""));
            bundle.id = bundle.id.substring(0, bundle.id.length - 7);
            changed = true;
        }
        var measureEntry = bundle.entry.find(function (e) { return e.resource.resourceType === 'Measure' && e.resource.id === bundleId; });
        var measure = measureEntry.resource;
        var libraryUrl = measure.library[0];
        var libraryEntry = bundle.entry.find(function (e) { return e.resource.resourceType === 'Library' && e.resource.url === libraryUrl; });
        var library = libraryEntry.resource;
        if (!library) {
            throw new Error("Library ".concat(libraryUrl, " not found!"));
        }
        if (!library.dataRequirement) {
            console.error("Library ".concat(libraryUrl, " doesn't have dataRequirement!"));
            return { value: false };
        }
        if (changed) {
            fs.writeFileSync(bundlePath, JSON.stringify(bundle));
        }
    };
    for (var _i = 0, bundleFolders_1 = bundleFolders; _i < bundleFolders_1.length; _i++) {
        var bundleId = bundleFolders_1[_i];
        var state_1 = _loop_1(bundleId);
        if (typeof state_1 === "object")
            return state_1.value;
    }
    return true;
}
function putBundle(server, bundle) {
    return __awaiter(this, void 0, void 0, function () {
        var url;
        return __generator(this, function (_a) {
            console.log("putting bundle ".concat(bundle.id, " on ").concat(server));
            url = server + (!server.endsWith('/') ? '/' : '') + 'Bundle/' + bundle.id;
            return [2 /*return*/, new Promise(function (resolve, reject) {
                    request({
                        method: 'PUT',
                        url: url,
                        body: bundle,
                        json: true
                    }, function (err, response, body) {
                        if (err) {
                            reject(err);
                        }
                        else {
                            console.log("Successfully put ".concat(bundle.id, " on the server, now has version id ").concat(body.meta.versionId));
                            resolve(body);
                        }
                    });
                })];
        });
    });
}
function put() {
    return __awaiter(this, void 0, void 0, function () {
        var index, server, bundleFolders, _i, bundleFolders_2, bundleId, bundlePath, bundleContent, bundle;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0:
                    index = process.argv.indexOf('--put');
                    if (index < 0) {
                        console.log('Not putting bundle on server');
                        return [2 /*return*/];
                    }
                    else if (index >= process.argv.length - 1) {
                        throw new Error('--put does not specify the server to put it on');
                    }
                    server = process.argv[index + 1];
                    bundleFolders = fs.readdirSync(measurePath);
                    _i = 0, bundleFolders_2 = bundleFolders;
                    _a.label = 1;
                case 1:
                    if (!(_i < bundleFolders_2.length)) return [3 /*break*/, 4];
                    bundleId = bundleFolders_2[_i];
                    bundlePath = path.join(measurePath, bundleId, bundleId + '-bundle.json');
                    bundleContent = fs.readFileSync(bundlePath).toString();
                    bundle = JSON.parse(bundleContent);
                    return [4 /*yield*/, putBundle(server, bundle)];
                case 2:
                    _a.sent();
                    _a.label = 3;
                case 3:
                    _i++;
                    return [3 /*break*/, 1];
                case 4: return [2 /*return*/];
            }
        });
    });
}
function run() {
    return __awaiter(this, void 0, void 0, function () {
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0: return [4 /*yield*/, refresh()];
                case 1:
                    _a.sent();
                    _a.label = 2;
                case 2:
                    if (!!check()) return [3 /*break*/, 4];
                    console.log('Check failed... re-refreshing');
                    return [4 /*yield*/, refresh()];
                case 3:
                    _a.sent();
                    return [3 /*break*/, 2];
                case 4:
                    console.log('Checks passed on the bundles');
                    return [4 /*yield*/, put()];
                case 5:
                    _a.sent();
                    return [2 /*return*/];
            }
        });
    });
}
run().then(function () { return console.log('Done'); });
//# sourceMappingURL=_refresh.js.map