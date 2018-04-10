package pers.adapter.java;

import java.util.ArrayList;

public class Adapter implements Target{

	ShopCart myCart;
	ArrayList<ProductInfo> linkItems = new ArrayList<ProductInfo>();
	
	public Adapter(ShopCart myCart)
	{
		this.myCart = myCart;
	}
	
	@Override
	public void placeOrder(ProductInfo x) {
		// TODO Auto-generated method stub
		myCart.placeOrder(x);
	}

	@Override
	public ArrayList<ProductInfo> addLikedGoods() {
		// TODO Auto-generated method stub
		
		ProductInfo p1 = new ProductInfo();
		p1.setPic_Path("Images//000001.png");
		linkItems.add(p1);
		ProductInfo p2 = new ProductInfo();
		p2.setPic_Path("Images//000002.png");
		linkItems.add(p2);
		ProductInfo p3 = new ProductInfo();
		p3.setPic_Path("Images//000003.png");
		linkItems.add(p3);
		ProductInfo p4 = new ProductInfo();
		p4.setPic_Path("Images//000004.png");
		linkItems.add(p4);
		
		return linkItems;
	}

}
