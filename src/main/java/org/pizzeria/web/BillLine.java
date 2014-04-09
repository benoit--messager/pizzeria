package org.pizzeria.web;

public class BillLine {
	private String item;
	private int count;
	private float singleCost;
	private float total;
	
	public String getItem() {
		return item;
	}
	public void setItem(String item) {
		this.item = item;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public float getSingleCost() {
		return singleCost;
	}
	public void setSingleCost(float singleCost) {
		this.singleCost = singleCost;
	}
	public float getTotal() {
		return total;
	}
	public void setTotal(float total) {
		this.total = total;
	}
}
