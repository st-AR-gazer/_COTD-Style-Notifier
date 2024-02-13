bool IsCurrentlyInCOTD() {
    auto app = cast<CTrackMania>(GetApp());
    auto network = cast<CTrackManiaNetwork>(app.Network);
    auto server_info = cast<CTrackManiaNetworkServerInfo>(network.ServerInfo);

    return server_info.CurGameModeStr == "TM_COTDQualifications_Online";
}