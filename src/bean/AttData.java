package bean;

public class AttData {
	private String attDate;
	private int att;
	
	public AttData() {
	}

	public AttData(String attDate, int att) {
		this.attDate = attDate;
		this.att = att;
	}

	@Override
	public String toString() {
		return "AttData [attDate=" + attDate + ", att=" + att + "]";
	}

	public String getAttDate() {
		return attDate;
	}

	public void setAttDate(String attDate) {
		this.attDate = attDate;
	}

	public int getAtt() {
		return att;
	}

	public void setAtt(int att) {
		this.att = att;
	}
	
}
