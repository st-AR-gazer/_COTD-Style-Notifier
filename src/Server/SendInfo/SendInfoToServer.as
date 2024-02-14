Json::Value g_jsonDataForServer;
string g_jsonDataForServerString;

void SendInfoToServer() {
    log("Sending data to server...", LogLevel::InfoG, 4);
    Net::HttpRequest req;
    req.Method = Net::HttpMethod::Post;
    req.Url = "http://cotd.xjk.yt/api/endpoint/";
    req.Body = g_jsonDataForServerString;
    req.Start();
    while (!req.Finished()) {
        yield();
    }
    log("Data sent response code: " + req.ResponseCode(), LogLevel::InfoG, 13);
    if (req.ResponseCode() == 200) {
        log("Data sent successfully: " + req.String(), LogLevel::InfoG, 15);
    } else if (req.ResponseCode() == 429) {
        log("Request was received, but was rate-limited", LogLevel::Warn, 17);
        log("Data-limit reached, after 200 requests I close down my server, I still really appreciate your effort though :D", LogLevel::Warn, 18);
    } else {
        log("Failed to send data. Response code: " + req.ResponseCode(), LogLevel::Error, 20);
    }
    return;
}