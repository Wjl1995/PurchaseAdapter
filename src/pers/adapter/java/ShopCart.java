package pers.adapter.java;

import java.util.ArrayList;

public class ShopCart {

	private ArrayList<ProductInfo> myItems = new ArrayList<ProductInfo>();
	
	public void setMyItems(ArrayList<ProductInfo> myItems)
	{
		this.myItems = myItems;
	}
	
	public ArrayList<ProductInfo> getItems()
	{
		return myItems;
	}
	
	public void placeOrder(ProductInfo x)
	{
		if (null != x)
		{
			if (0 == myItems.size())
			{
				ProductInfo temp = new ProductInfo();
				temp.setPName(x.getPName());
				temp.setPic_Path(x.getPic_Path());
				temp.setP_Price(x.getP_Price());
				temp.setPMount(x.getPMount());
				myItems.add(temp);
			}
			else
			{
				int i = 0;
				for(; i<myItems.size(); i++)
				{
					ProductInfo temp = myItems.get(i);
					if (temp.getPName().equals(x.getPName()))
					{
						temp.setPMount(temp.getPMount()+1);
						break;
					}
				}
				if (i >= myItems.size())
				{
					ProductInfo temp = new ProductInfo();
					temp.setPName(x.getPName());
					temp.setPic_Path(x.getPic_Path());
					temp.setP_Price(x.getP_Price());
					temp.setPMount(x.getPMount());
					myItems.add(temp);
				}
			}
		}
	}
}
