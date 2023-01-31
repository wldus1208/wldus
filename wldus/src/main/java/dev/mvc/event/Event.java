package dev.mvc.event;
import java.io.File;

public class Event {

    public static synchronized String getUploadDir() {
        String path = "";
        if (File.separator.equals("/")) {
            path="/wldus/src/main/resources/static/event/storage";
        } else {
            
            path = "/home/ubuntu/deploy/wldus/event/storage/";
        }
        
        return path;
    }
    
}