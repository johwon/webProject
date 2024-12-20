package co.kh.edu.basket.model;

public class BasketVO {
	private int num;
	private String cId;
	private int pNum;
	private String size;
	private String color;
	private String pName;
	private int price;

	public BasketVO() {
		super();
	}

	public BasketVO(int num, String cId, int pNum, String size, String color) {
		super();
		this.num = num;
		this.cId = cId;
		this.pNum = pNum;
		this.size = size;
		this.color = color;
	}

	public BasketVO(int num, String cId, int pNum, String size, String color, String pName, int price) {
		super();
		this.num = num;
		this.cId = cId;
		this.pNum = pNum;
		this.size = size;
		this.color = color;
		this.pName = pName;
		this.price = price;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getcId() {
		return cId;
	}

	public void setcId(String cId) {
		this.cId = cId;
	}

	public int getpNum() {
		return pNum;
	}

	public void setpNum(int pNum) {
		this.pNum = pNum;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "BasketVO [num=" + num + ", cId=" + cId + ", pNum=" + pNum + ", size=" + size + ", color=" + color
				+ ", pName=" + pName + ", price=" + price + "]";
	}

	

}
