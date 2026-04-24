
PACKAGE_ID = "gov.cdc.nhsn.safr"
DESTINATION =  "/{4}/ig"
#split_pack = 
print(DESTINATION.format('',*PACKAGE_ID.split('.')))

#print(DESTINATION.format("sky", "blue", "green", "yellow", "red"))