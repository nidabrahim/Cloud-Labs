import org.apache.hadoop.io.Writable;


/*
 * 	YOUSSEF NIDABRAHIM
 *  ZZ3 - F2
 * 
 * 	WRITABLE OBJECT THAT STORES THREES VALUES
 */

public class CustomMaxAverageTuple implements Writable {
	
	private Double average = new Double(0);
	private Double max = new Double(0);
	private long count = 1;
	
	
	public Double getAverage() {
		return average;
	}
	
	public void setAverage(Double average) {
		this.average = average;
	}
	
	public Double getMax() {
		return max;
	}
	
	public void setMax(Double max) {
		this.max = max;
	}
	
	public long getCount() {
		return count;
	}
	
	public void setCount(long count) {
		this.count = count;
	}

	public String toString() {
		return average + "\t" + max + "\t" + count;
	}

}
