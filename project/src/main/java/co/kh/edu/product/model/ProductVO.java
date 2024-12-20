package co.kh.edu.product.model;

public class ProductVO {
	private int num;
	private String name;
	private int price;

	public ProductVO() {
		super();
	}

	public ProductVO(int num, String name, int price) {
		super();
		this.num = num;
		this.name = name;
		this.price = price;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "ProductVO [num=" + num + ", name=" + name + ", price=" + price + "]";
	}


}
