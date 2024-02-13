bool TimeRestriction() {
    int currentTimestamp = Time::get_Stamp();
    
    Time::Info currentTime = Time::Parse(currentTimestamp);
    
    int startHour = 19;
    int startMinute = 59;

    int endHour = 20;
    int endMinute = 2;

    if ((currentTime.Hour > startHour || (currentTime.Hour == startHour && currentTime.Minute >= startMinute)) &&
        (currentTime.Hour < endHour || (currentTime.Hour == endHour && currentTime.Minute <= endMinute))) {
        return true;
    }

    return false;
}

int GetTimeFormatted() {
    int currentTimestamp = Time::get_Stamp();
    
    Time::Info currentTime = Time::Parse(currentTimestamp);
    
    return currentTime;
}

int GetTimeStamp() {
    return Time::get_Stamp();
}