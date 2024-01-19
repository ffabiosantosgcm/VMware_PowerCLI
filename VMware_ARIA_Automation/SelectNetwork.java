var host = VraHostManager.defaultHostData;
var allnetworks = VraEntitiesFinder.getFabricNetworks(host);

var networks = [];
var networktags = [];
var tagprefix = "Environment" // tag prefix (environment:dev / environment:prod)

for (var inetwork = 0; inetwork < allnetworks.length; inetwork++) {
    if (allnetworks[inetwork].tags != null) {
        networktags = allnetworks[inetwork].tags;
        for (var itags = 0; itags < networktags.length; itags++) {
            if (networktags[itags].value == ambiente && networktags[itags].key == tagprefix){
                networks.push(allnetworks[inetwork].name.toLowerCase());
            }
        }
    }
}
return networks.sort();
