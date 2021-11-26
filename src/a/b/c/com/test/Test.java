package a.b.c.com.test;

public class Test {

	static  String parameter = "cid=TC0ONETIME&partner_order_id=partner_order_id&partner_user_id=partner_user_id&item_name=초코파이&quantity=1&total_amount=1000&vat_amount=200&tax_free_amount=0&approval_url=http://localhost:8088/point.wd?&fail_url=http://localhost:8088/&cancel_url=http://localhost:8088/"
		               +"order_id&partner_use";
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		System.out.println("parameter " + parameter);
		
		String s[] = parameter.split("&");
		for (int i=0; i < s.length; i++ ) {
			System.out.println("s["+i+"] >>> : " + s[i]);
		}
		
		String ab= s[3];
		String abc = s[5];
		System.out.println(s[3] + s[5]);
		
		
	}

}
