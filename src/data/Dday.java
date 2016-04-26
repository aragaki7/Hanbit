package data;

import java.util.Calendar;

public class Dday {

	/**
	 * Get D-DAY
	 * 
	 * @int
	 */
	public int getDays() {
		Calendar calendar = Calendar.getInstance();

		int day = calendar.get(Calendar.DAY_OF_MONTH);
		int maxday = calendar.getMaximum(Calendar.DAY_OF_MONTH);

		return maxday - day;

	}

	/**
	 * Get Month
	 * @int
	 */
	
	public int getMonth() {
		Calendar calendar = Calendar.getInstance();
		int month = calendar.get(Calendar.MONTH) + 2;
		if (month == 13) {
			month = 1;
		}
		return month;
	}
}
