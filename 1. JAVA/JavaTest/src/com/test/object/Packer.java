package com.test.object;

public class Packer {
	
	private static int pencilCount;
	private static int eraserCount;
	private static int ballPointPenCount;
	private static int rulerCount;
	
	//연필 검수
	public void packing(Pencil pencil) {
		
		System.out.printf("포장 전 검수 : %s 진하기 연필입니다.\n", pencil.getHardness());
		
		if (pencil.getHardness().equals("4B") || pencil.getHardness().equals("3B")
				|| pencil.getHardness().equals("2B") || pencil.getHardness().equals("B")
				|| pencil.getHardness().equals("HB") || pencil.getHardness().equals("H")
				|| pencil.getHardness().equals("2H") || pencil.getHardness().equals("3H")
				|| pencil.getHardness().equals("4H")) {
			
			pencilCount++;
			
			System.out.println("포장을 완료했습니다.");
			
		} else {
			
			System.out.println("포장 못해요");
			
		}
		
		
	}
	//지우개 검수
	public void packing(Eraser eraser) {
		
		System.out.printf("포장 전 검수 : %s 사이즈 지우개입니다.\n", eraser.getSize());
		
		if (eraser.getSize().equals("Large") || eraser.getSize().equals("Medium") 
				|| eraser.getSize().equals("Small")) {
			
			eraserCount++;
			
			System.out.println("포장을 완료했습니다.");
			
		} else {
			
			System.out.println("포장 못해요.");
			
		}
		
		
		
	}
	//볼펜 검수
	public void packing(BallPointPen ballPointPen) {
		
		System.out.printf("포장 전 검수 : %s 색상 %.1fmm 볼펜입니다.\n"
							, ballPointPen.getColor(), ballPointPen.getThickness());
		
		if ((ballPointPen.getThickness() == 0.3 || ballPointPen.getThickness() == 0.5 
				|| ballPointPen.getThickness() == 0.7 || ballPointPen.getThickness() == 1 
				|| ballPointPen.getThickness() == 1.5) 
				&& (ballPointPen.getColor().equals("red") || ballPointPen.getColor().equals("blue") 
					|| ballPointPen.getColor().equals("green") || ballPointPen.getColor().equals("black"))) {
			
			ballPointPenCount++;
			
			System.out.println("포장을 완료했습니다.");
			
		} else {
			
			System.out.println("포장 못해요.");
			
		}
		
		
	}
	//자 검수
	public void packing(Ruler ruler) {
		
		System.out.printf("포장 전 검수 : %dcm %s입니다.\n", ruler.getLength(), ruler.getShape());
		
		if ((ruler.getLength() == 30 || ruler.getLength() == 50 || ruler.getLength() == 100)
				&& (ruler.getShape().equals("줄자") || ruler.getShape().equals("운형자") 
						|| ruler.getShape().equals("삼각자"))) {
			
			rulerCount++;
			
			System.out.println("포장을 완료했습니다.");
			
		} else {
			
			System.out.println("포장 못해요.");
			
		}
		
	}
	//포장 결과 출력
	public void countPacking(int type) {
		
		System.out.println("=======================");
		System.out.println("      포장 결과");
		System.out.println("=======================");
		
		if (type == 0) {
			
			System.out.printf("연필 %d회\n지우개 %d회\n볼펜 %d회\n자 %d회\n"
						, pencilCount, eraserCount, ballPointPenCount, rulerCount);
			System.out.println();
			
		} else if (type == 1) {
			
			System.out.printf("연필 %d회\n", pencilCount);
			System.out.println();
			
			
		} else if (type == 2) {
			
			System.out.printf("지우개 %d회\n", eraserCount);
			System.out.println();
			
		} else if (type == 3) {
			
			System.out.printf("볼펜 %d회\n", ballPointPenCount);
			System.out.println();
			
		} else if (type == 4) {
			
			System.out.printf("자 %d회\n", rulerCount);
			System.out.println();
			
		}
		
	}

}
