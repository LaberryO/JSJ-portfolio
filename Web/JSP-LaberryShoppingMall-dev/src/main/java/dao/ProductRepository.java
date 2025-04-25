package dao;

import java.util.ArrayList;

import dto.Product;

public class ProductRepository {
	private ArrayList<Product> listOfProducts = new ArrayList<Product>();
	// 싱글톤 객체 생성
	private static ProductRepository instance = new ProductRepository();
	public static ProductRepository getInstance() {
		return instance;
	}
	
	public ArrayList<Product> getAllProducts() {
		return listOfProducts;
	}
	
	public Product getProductById(String productId) {
		Product productById = null;
		
		for(int i=0; i<listOfProducts.size(); i++) {
			Product product = listOfProducts.get(i);
			if(product != null && product.getProductId() != null && product.getProductId().equals(productId)) {
				productById = product;
				break;
			}
		}
		return productById;
		
	}
	
	//하나의 제품에 대한 다양한 정보를 제품
	public void addProduct(Product product) {
		listOfProducts.add(product);
	}
}
