package clientData;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import model.User;

public class DateSetter {

	public void dates(User user, Date date) {


		Calendar cal = Calendar.getInstance();
		DateFormat df = new SimpleDateFormat("EEEE MMMM dd, yyyy");

		cal.setTime(date);
		
		
		cal.add(Calendar.DAY_OF_WEEK_IN_MONTH, -52);
		Date month12 = cal.getTime();
		
		cal.add(Calendar.DAY_OF_WEEK_IN_MONTH, +4);
		Date month11 = cal.getTime();

		cal.add(Calendar.DAY_OF_WEEK_IN_MONTH, +4);
		Date month10 = cal.getTime();

		cal.add(Calendar.DAY_OF_WEEK_IN_MONTH, +4);
		Date month9 = cal.getTime();
		
		cal.add(Calendar.DAY_OF_WEEK_IN_MONTH, +4);
		Date month8 = cal.getTime();
		
		cal.add(Calendar.DAY_OF_WEEK_IN_MONTH, +8);
		Date month6 = cal.getTime();
		
		cal.add(Calendar.DAY_OF_WEEK_IN_MONTH, +4);
		Date month5 = cal.getTime();
		
		cal.add(Calendar.DAY_OF_WEEK_IN_MONTH, +4);
		Date month4 = cal.getTime();
		
		cal.add(Calendar.DAY_OF_WEEK_IN_MONTH, +4);
		Date month3 = cal.getTime();
		
		cal.add(Calendar.DAY_OF_WEEK_IN_MONTH, +4);
		Date month2 = cal.getTime();
		
		cal.add(Calendar.DATE, +14);
		Date week6 = cal.getTime();
		
		cal.add(Calendar.DATE, +14);
		Date week4 = cal.getTime();
		
		cal.add(Calendar.DATE, +14);
		Date week2 = cal.getTime();
		

		user.setMonth12(df.format(month12));
		user.setMonth11(df.format(month11));
		user.setMonth10(df.format(month10));
		user.setMonth9(df.format(month9));
		user.setMonth8(df.format(month8));
		user.setMonth6(df.format(month6));
		user.setMonth5(df.format(month5));
		user.setMonth4(df.format(month4));
		user.setMonth3(df.format(month3));
		user.setMonth2(df.format(month2));
		user.setWeek6(df.format(week6));
		user.setWeek4(df.format(week4));
		user.setWeek2(df.format(week2));
		
		
	}

}
