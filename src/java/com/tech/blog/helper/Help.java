/**
 *
 * @author Ankush
 */
package com.tech.blog.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

public class Help {

    public static boolean deletefile(String path) {
        boolean f = false;
        try {
            File file = new File(path);
            
            if (file.exists()) {
                file.delete();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    public static boolean savefile(InputStream is,String path){
        boolean f=false;
        try {
            byte b[]=new byte[is.available()];
            is.read(b);
            FileOutputStream fos=new FileOutputStream(path);
            fos.write(b);
            fos.flush();
            fos.close();
            f=true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
}
