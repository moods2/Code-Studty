package com.test.object;

public class Coffee {
	
	private static int bean;
	private static int water;
	private static int ice;
	private static int milk;
	
	private static int beanUnitprice = 1;
	private static double waterUnitprice = 0.2;
	private static int iceUnitPrice = 3;
	private static int milkUnitPrice = 4;
	
	private static int beanTotalPrice;
	private static double waterTotalPrice;
	private static int iceTotalPrice;
	private static int milkTotalPrice;
	
	private static int americano;
	private static int latte;
	private static int espresso;
	
	//총 원두량
	public static int getBean() {
		return bean;
	}
	public static void setBean(int bean) {
		Coffee.bean = bean;
	}
	
	
	//총 물 용량
	public static int getWater() {
		return water;
	}
	public static void setWater(int water) {
		Coffee.water = water;
	}
	
	
	//총 얼음 개수
	public static int getIce() {
		return ice;
	}
	public static void setIce(int ice) {
		Coffee.ice = ice;
	}
	
	
	//총 우유 용량
	public static int getMilk() {
		return milk;
	}
	public static void setMilk(int milk) {
		Coffee.milk = milk;
	}
	
	
	//원두 단가
	public static int getBeanUnitprice() {
		return beanUnitprice;
	}
	public static void setBeanUnitprice(int beanUnitprice) {		
		Coffee.beanUnitprice = beanUnitprice;
	}
	
	
	//물 단가
	public static double getWaterUnitprice() {
		return waterUnitprice;
	}
	public static void setWaterUnitprice(double waterUnitprice) {
		Coffee.waterUnitprice = waterUnitprice;
	}	
	
	
	//얼음 단가
	public static int getIceUnitPrice() {
		return iceUnitPrice;
	}
	public static void setIceUnitPrice(int iceUnitPrice) {
		Coffee.iceUnitPrice = iceUnitPrice;
	}
	
	
	//우유 단가
	public static int getMilkUnitPrice() {
		return milkUnitPrice;
	}
	public static void setMilkUnitPrice(int milkUnitPrice) {
		Coffee.milkUnitPrice = milkUnitPrice;
	}
	
	
	//원두 총 판매액
	public static int getBeanTotalPrice() {
		return beanTotalPrice;
	}
	public static void setBeanTotalPrice(int beanTotalPrice) {	
		beanTotalPrice = bean * beanUnitprice;
		Coffee.beanTotalPrice = beanTotalPrice;
	}
	
	
	//물 총 판매액
	public static double getWaterTotalPrice() {
		return waterTotalPrice;
	}
	public static void setWaterTotalPrice(double waterTotalPrice) {
		waterTotalPrice = water * waterUnitprice;
		Coffee.waterTotalPrice = waterTotalPrice;
	}
	
	
	//얼음 총 판매액
	public static int getIceTotalPrice() {
		return iceTotalPrice;
	}
	public static void setIceTotalPrice(int iceTotalPrice) {
		iceTotalPrice = ice * iceUnitPrice;
		Coffee.iceTotalPrice = iceTotalPrice;
	}
	
	
	//우유 총 판매액
	public static int getMilkTotalPrice() {
		return milkTotalPrice;
	}
	public static void setMilkTotalPrice(int milkTotalPrice) {
		milkTotalPrice = milk * milkUnitPrice;
		Coffee.milkTotalPrice = milkTotalPrice;
	}
	
	
	//아메리카노 총 판매 개수
	public static int getAmericano() {
		return americano;
	}
	public static void setAmericano(int americano) {
		Coffee.americano = americano;
	}
	
	
	//라테 총 판매 개수
	public static int getLatte() {
		return latte;
	}
	public static void setLatte(int latte) {
		Coffee.latte = latte;
	}
	
	
	//에스프레소 총 판매 개수
	public static int getEspresso() {
		return espresso;
	}
	public static void setEspresso(int espresso) {
		Coffee.espresso = espresso;
	}
	

}
