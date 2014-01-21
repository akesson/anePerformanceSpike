package co.serendipi.spike.ane;

import android.util.Log;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREExtension;

public class BasicANE implements FREExtension {

    private BasicANEContext context = null;

    @Override
    public void initialize() {
    }

    @Override
    public FREContext createContext(String s) {
        if (context == null) {
            context = new BasicANEContext();
        }
        return context;
    }

    @Override
    public void dispose() {

    }
}
