package clientData;

import java.util.ArrayList;

import model.Vendor;

public class MakeProfile {

	public Vendor profile(ArrayList<Vendor> vendors, String profile) {
		Vendor ven = new Vendor();
		for(int i = 0; i < vendors.size(); i++){
			Vendor vendor = vendors.get(i);
			if(vendor.getBusinessName().equals(profile)){
				
				ven.setBusinessEmail(vendor.getBusinessEmail());
				ven.setBusinessName(vendor.getBusinessName());
				ven.setBusinessWebsite(vendor.getBusinessWebsite());
				ven.setCategory(vendor.getCategory());
				
				ven.setCity(vendor.getCity());
				ven.setState(vendor.getState());
				ven.setZip(vendor.getZip());
				
				ven.setStartingPackage(vendor.getStartingPackage());
				ven.setMaxPackage(vendor.getMaxPackage());
				
				ven.setFacebook(vendor.getFacebook());
				ven.setPintrest(vendor.getPintrest());
				ven.setTwitter(vendor.getTwitter());
				ven.setYoutube(vendor.getYoutube());
				ven.setInstagram(vendor.getInstagram());
				ven.setAbout(vendor.getAbout());
				
				ven.setProfileImg(vendor.getProfileImg());
				break;
			}
		
		
	}
		return ven;

}

		
	}
