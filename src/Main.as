auto g_app;
auto g_network;
auto g_serverInfo;

void Main() {
    NadeoServices::AddAudience("NadeoClubServices");
    while (!NadeoServices::IsAuthenticated("NadeoClubServices")) {
      yield();
    }
    if (!isInCOTD) return;

    startnew();
}

void Update(float dt) {
    auto g_app = cast<CTrackMania>(GetApp());
    auto g_network = cast<CTrackManiaNetwork>(app.Network);
    auto g_serverInfo = cast<CTrackManiaNetworkServerInfo>(network.ServerInfo);

    server_info.CurGameModeStr == "TM_COTDQualifications_Online"
} 