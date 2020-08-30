package com.test.object;

public class Barista {
	
	
	//에스프레소 한잔
	public Espresso makeEspresso(int bean) {
		
		Espresso e = new Espresso();
		
		e.setBean(bean);
		
		Coffee.setBean(Coffee.getBean() + bean);
		
		Coffee.setEspresso(Coffee.getEspresso() + 1);
		
		return e;
		
	}
	//에스프레소 여러잔
	public Espresso[] makeEspressoes(int bean, int count) {
		
		Espresso[] e1 = new Espresso[count];
		
		for (int i=0; i<count; i++) {
			
			e1[i] = new Espresso();
			e1[i].setBean(bean);
			Coffee.setBean(Coffee.getBean() + bean);
			Coffee.setEspresso(Coffee.getEspresso() + 1);
			
		}
		
		return e1;
		
	}
	//라테 한잔
	public Latte makeLatte(int bean, int milk) {
		
		Latte l = new Latte();
		
		l.setBean(bean);
		l.setMilk(milk);
		
		Coffee.setBean(Coffee.getBean() + bean);
		Coffee.setMilk(Coffee.getMilk() + milk);
		
		Coffee.setLatte(Coffee.getLatte() + 1);
		
		return l;
		
	}
	//라테 여러잔
	public Latte[] makeLattes(int bean, int milk, int count) {
		
		Latte[] l1 = new Latte[count];
		
		for (int i=0; i<count; i++) {
			
			l1[i] = new Latte();
			l1[i].setBean(bean);
			l1[i].setMilk(milk);
			Coffee.setBean(Coffee.getBean() + bean);
			Coffee.setMilk(Coffee.getMilk() + milk);
			Coffee.setLatte(Coffee.getLatte() + 1);
			
		}
		
		
		return l1;
		
	}
	//아메리카노 한잔
	public Americano makeAmericano(int bean, int water, int ice) {
		
		Americano a = new Americano();
		
		a.setBean(bean);
		a.setWater(water);
		a.setIce(ice);
		
		Coffee.setBean(Coffee.getBean() + bean);
		Coffee.setWater(Coffee.getWater() + water);
		Coffee.setIce(Coffee.getIce() + ice);
		
		Coffee.setAmericano(Coffee.getAmericano() + 1);
		
		return a;
		
	}
	//아메리카노 여러잔
	public Americano[] makeAmericanos(int bean, int water, int ice, int count) {
		
		Americano[] a1 = new Americano[count];
		
		for (int i=0; i<count; i++) {
			
			a1[i] = new Americano();
			a1[i].setBean(bean);
			a1[i].setWater(water);
			a1[i].setIce(ice);
			
			Coffee.setBean(Coffee.getBean() + bean);
			Coffee.setWater(Coffee.getWater() + water);
			Coffee.setIce(Coffee.getIce() + ice);		
			Coffee.setAmericano(Coffee.getAmericano() + 1);
			
		}
		
		return a1;
		
	}
	//판매결과
	public void result() {
		
		System.out.println("==========================");
		System.out.println("        판매 결과");
		System.out.println("==========================");
		System.out.println();
		
		System.out.println("--------------------------");
		System.out.println("       음료 판매량");
		System.out.println("--------------------------");
		System.out.printf("에스프레소 : %d잔\n아메리카노 : %d잔\n라테 : %d잔"
							, Coffee.getEspresso(), Coffee.getAmericano(), Coffee.getLatte());
		System.out.println();
		
		System.out.println("--------------------------");
		System.out.println("      원자재 소비량");
		System.out.println("--------------------------");
		System.out.printf("원두 : %,dg\n물   : %,dml\n얼음 : %,d개\n우유 : %,dml\n"
							, Coffee.getBean(), Coffee.getWater(), Coffee.getIce(), Coffee.getMilk());
		System.out.println();
		
		System.out.println("--------------------------");
		System.out.println("         매출액");
		System.out.println("--------------------------");
		System.out.printf("원두 : %,d원\n물   : %,.0f원\n얼음 : %,d원\n우유 : %,d원\n"
							, Coffee.getBean() * Coffee.getBeanUnitprice()
							, Coffee.getWater() * Coffee.getWaterUnitprice()
							, Coffee.getIce() * Coffee.getIceUnitPrice()
							, Coffee.getMilk() * Coffee.getMilkUnitPrice());

		
	}
	

}
