package com.xthena.util;

import javax.imageio.ImageIO;
import java.awt.*;
import java.io.File;
import java.io.InputStream;

/**
 * Created by jianbingfang on 2015/7/6.
 */
public class FileUtil {

    public static boolean isImage(File imageFile) {
        if (!imageFile.exists()) {
            return false;
        }
        Image img = null;
        try {
            img = ImageIO.read(imageFile);
            if (img == null || img.getWidth(null) <= 0 || img.getHeight(null) <= 0) {
                return false;
            }
            return true;
        } catch (Exception e) {
            return false;
        } finally {
            img = null;
        }
    }

    public static boolean isImage(InputStream imageFile) {
        Image img = null;
        try {
            img = ImageIO.read(imageFile);
            if (img == null || img.getWidth(null) <= 0 || img.getHeight(null) <= 0) {
                return false;
            }
            return true;
        } catch (Exception e) {
            return false;
        } finally {
            img = null;
        }
    }

    public static boolean isVideo(String filename) {
        return getFileType(filename).equalsIgnoreCase("mp4");
    }

    public static String getFileType(String filename) {
        String fileType = "";
        if (filename.indexOf(".") > 0) {
            int start = filename.lastIndexOf(".");
            fileType = filename.substring(start + 1, filename.length());
        }
        return fileType;
    }
}
