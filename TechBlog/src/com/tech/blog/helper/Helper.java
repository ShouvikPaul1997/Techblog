package com.tech.blog.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

public class Helper {

	public static boolean deleteFile(String path) {
		boolean b = false;
		try {

			File f = new File(path);
			b = f.delete();

		} catch (Exception e) {

		}

		return b;

	}

	public static boolean saveFile(InputStream is, String path) {
		boolean f = false;

		try {

			byte[] b = new byte[is.available()];

			is.read(b);

			FileOutputStream fos = new FileOutputStream(path);
			fos.write(b);
			fos.flush();
			fos.close();
			f=true;
		} catch (Exception e) {
		}

		return f;

	}

}
