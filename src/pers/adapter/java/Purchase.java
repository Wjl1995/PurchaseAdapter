package pers.adapter.java;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Purchase
 */
@WebServlet({ "/Purchase", "/WebContent/Purchase.jsp" })
public class Purchase extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private ShopCart myCart = new ShopCart();
	private ArrayList<ProductInfo> myBuyList = myCart.getItems();
	private Target xxx = new Adapter(myCart);
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Purchase() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
	}
	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		try{
			String pName = (String)request.getParameter("pName");
			String pPath = (String)request.getParameter("pPath");
			String pPrice = (String)request.getParameter("pPrice");
			ProductInfo myProduct = new ProductInfo();
			myProduct.setPName(pName);
			myProduct.setPic_Path(pPath);
			myProduct.setP_Price(Double.parseDouble(pPrice));
			myProduct.setPMount(1);
			xxx.placeOrder(myProduct);
			ArrayList<ProductInfo> myLinkList = xxx.addLikedGoods();
			HttpSession mySession = request.getSession();
			mySession.setAttribute("MyGoods", myBuyList);
			mySession.setAttribute("MyLinkGoods", myLinkList);
			request.getRequestDispatcher("ProductList.jsp").forward(request, response);
		}
		finally{
			out.close();
		}
	}
	
	public String getServletInfo(){
		return "Short description";
	}

}
