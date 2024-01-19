var host = VraHostManager.defaultHostData;
var allnetworks = VraEntitiesFinder.getFabricNetworks(host);

var networks = [];
var networktags = [];
var list_tags = [];

for (var inetwork = 0; inetwork < allnetworks.length; inetwork++) {
    if (allnetworks[inetwork].tags != null) {
        networktags = allnetworks[inetwork].tags;
        for (var itags = 0; itags < networktags.length; itags++) {
                list_tags.push(networktags[itags].value)
        }
    }
}
return list_tags.sort();