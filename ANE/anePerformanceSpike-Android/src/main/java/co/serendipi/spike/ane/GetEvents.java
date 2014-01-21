package co.serendipi.spike.ane;/**
 * Created by mjambert on 16/01/14.
 */

import android.annotation.TargetApi;
import android.content.ContentResolver;
import android.database.Cursor;
import android.os.Build;
import android.provider.CalendarContract;
import android.util.Log;

import com.adobe.fre.FREArray;
import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;

public class GetEvents implements FREFunction {


    public static final String[] EVENT_PROJECTION = new String[] {
            CalendarContract.Events._ID,
            CalendarContract.Events.TITLE,
            CalendarContract.Events.EVENT_LOCATION,
            CalendarContract.Events.DESCRIPTION,
            CalendarContract.Events.DTSTART,
            CalendarContract.Events.DTEND,
            CalendarContract.Events.DURATION,
            CalendarContract.Events.CALENDAR_ID
    };



    @TargetApi(Build.VERSION_CODES.ICE_CREAM_SANDWICH)
    @Override
    public FREObject call(FREContext freContext, FREObject[] freArguments) {
        long duration = System.currentTimeMillis();
        try {
            String calendarId = freArguments[0].getAsString();
            long startInSeconds = (long) freArguments[1].getAsDouble();
            long endInSeconds = (long) freArguments[2].getAsDouble();
            FREArray events = (FREArray) freArguments[3];

            ContentResolver cr = freContext.getActivity().getContentResolver();
            Cursor cur = cr.query(CalendarContract.Events.CONTENT_URI, EVENT_PROJECTION,
                    "((dtstart >= ?) AND (dtend <= ?))",
                    new String[] { String.valueOf(startInSeconds * 1000L), String.valueOf(endInSeconds * 1000L) }, null);

            events.setLength(cur.getCount());
            long i = 0;
            while (cur.moveToNext()) {
                FREObject calendarEvent = FREObject.newObject("sd.ane.calendar.CalendarEvent", null);
                fillCalendarEvent(calendarEvent, cur);
                events.setObjectAt(i, calendarEvent);
                ++i;
            }
            cur.close();
            duration = System.currentTimeMillis() - duration;
            Log.i("SERENDIPI", String.format("call duration = %d ms", duration));
            return null;
        } catch (Exception e) {
            Log.i("SERENDIPI", e.getMessage());
            return null;
        }
    }


    private final void fillCalendarEvent(FREObject freObject, Cursor cursor) throws Exception {
        freObject.setProperty("title", FREObject.newObject(cursor.getString(1)));
        freObject.setProperty("eventId", FREObject.newObject(cursor.getString(0)));
        //freObject.setProperty("calendarId", FREObject.newObject(cursor.getString(3)));
        //freObject.setProperty("isAllDay", FREObject.newObject(cursor.getString(0)));
        freObject.setProperty("start", FREObject.newObject(cursor.getLong(4) / 1000));
        freObject.setProperty("end", FREObject.newObject(cursor.getLong(5) / 1000));
        freObject.setProperty("calendarId", FREObject.newObject(String.valueOf(cursor.getInt(7))));
        //freObject.setProperty("duration", FREObject.newObject(cursor.getString(0)));
        //freObject.setProperty("notes", FREObject.newObject(cursor.getString(0)));
        //freObject.setProperty("location", FREObject.newObject(cursor.getString(0)));
    }

}
