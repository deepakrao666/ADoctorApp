package com;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Scanner;

public class TestDate {
	private static final DateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	private static final DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");

	public static void main(String[] args) {

		Date date1 = new Date();
		System.out.println("1 . = "+sdf.format(date1));

		Calendar cal = Calendar.getInstance();
		System.out.println("2 . = "+sdf.format(cal.getTime()));

		LocalDateTime now = LocalDateTime.now();
		System.out.println("3 . = "+dtf.format(now));

		LocalDate localDate = LocalDate.now();
		String s = DateTimeFormatter.ofPattern("yyyy/MM/dd").format(localDate);
		System.out.println("4 . = "+s);
		
		
		
		int n;
        ArrayList<String> al = new ArrayList<String>();
        Scanner in = new Scanner(System.in);
        n = in.nextInt();
        String da[] = new String[n];
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        sdf.setLenient(false);
        Date date[] = new Date[n];
        in.nextLine();
        for (int i = 0; i < da.length; i++) {
            da[i] = in.nextLine();
        }
        for (int i = 0; i < da.length; i++) {

            try {
                date[i] = sdf.parse(da[i]);
            } catch (ParseException e) {

                e.printStackTrace();
            }
        }

        in.close();

	}
}
