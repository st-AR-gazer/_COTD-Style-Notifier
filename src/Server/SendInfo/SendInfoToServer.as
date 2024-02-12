void SendInfoToServer(const string &in jsonData) {
    Net::HttpRequest req;
    req.Method = Net::HttpMethod::Post;
    req.Url = "http://cotd.contoso.com/api/endpoint";
    req.Body = jsonData;
    req.Start();
    while (!req.Finished()) {
        yield();
    }
    if (req.ResponseCode() == 200) {
        log("Data sent successfully: " + req.String(), LogLevel::InfoG, 11);
    } else if (req.ResponseCode() == 429) {
        log("Request was receved, but was rate-limited", LogLevel::Warn, 13)
        log("Data-limit reached, after 200 requests I close down my server, I still really apprechiate your effort though :D", LogLevel::Warn, 14);
        return;
    } else {
        log("Failed to send data. Response code: " + req.ResponseCode(), LogLevel::Error, 13);
        return;
    }
}