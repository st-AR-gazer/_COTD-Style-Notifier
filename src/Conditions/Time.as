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

string GetTime(const string &in Time) {
    int currentTimestamp = Time::get_Stamp();
    
    if (Time == "stamp" || Time == "Stamp") { return "" + currentTimestamp; }

    Time::Info currentTime = Time::Parse(currentTimestamp);
    
    if (Time == "second" || Time == "Second") { return "" + currentTime.Second; }
    else if (Time == "minute" || Time == "Minute") { return "" + currentTime.Minute; }
    else if (Time == "hour" || Time == "Hour") { return "" + currentTime.Hour; }
    else if (Time == "day" || Time == "Day") { return "" + currentTime.Day; }
    else if (Time == "month" || Time == "Month") { return "" + currentTime.Month; }
    else if (Time == "year" || Time == "Year") { return "" + currentTime.Year; }
    else if (Time == "format" || Time == "Format") {
        return currentTime.Year + "-" + currentTime.Month + "-" + currentTime.Day + " : " + currentTime.Hour + "_" + currentTime.Minute + "_" + currentTime.Second;
    }

    return "Invalid time format. Input: " + Time + " is not a valid time format. Valid formats are: 'second', 'minute', 'hour', 'day', 'month', 'year', 'format'. Go to 'Time.as' to se the list of available inputs";
}

string GetTimeF() {
    return GetTime("format");
}