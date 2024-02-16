bool Perms() {
    bool hasPermission = Permissions::PlayOnlineCompetition();
    if (!hasPermission) { NotifyWarn("Sorry, but you do not have the required permissions to use this plugin :( , please buy club to use it :)") }

    return hasPermission;
}
