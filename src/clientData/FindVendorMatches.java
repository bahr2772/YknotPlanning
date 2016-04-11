package clientData;

import java.util.ArrayList;

import model.Budget;
import model.User;
import model.Vendor;

public class FindVendorMatches {

	public ArrayList<Vendor> matchMaker(Budget bud, User user, ArrayList<Vendor> vendor) {

		ArrayList<Vendor> vendorMatches = new ArrayList<Vendor>();
		double hmuMin = bud.getTotal()*.001;
		double hmuMax = bud.getTotal()*.03;
		double caterMin	= bud.getRecepMin()*.15;
		double caterMax = bud.getRecepMax()*.25;
		double recepVenMin = bud.getRecepMin()*.07;
		double recepVenMax = bud.getRecepMax()*.15;
		double offMin	= bud.getMiscMin()*.005;
		double offMax =	bud.getMiscMax()*.02;
		
		if(vendor != null){
		for(int i = 0; i < vendor.size(); i++){
			Vendor ven = vendor.get(i);
			double venStart = Double.parseDouble(ven.getStartingPackage().replace("+", ""));
			double venMax = Double.parseDouble(ven.getMaxPackage().replace("+", ""));
			
			
			
			
			if(ven.getCategory().equalsIgnoreCase("photographer") && venStart <= bud.getPhotoAvg() && bud.getPhotoAvg() <= venMax)
				vendorMatches.add(ven);
			if(ven.getCategory().equalsIgnoreCase("band") && venStart <= bud.getEnterAvg() && bud.getEnterAvg() <= venMax)
				vendorMatches.add(ven);
			if(ven.getCategory().equalsIgnoreCase("dj") && venStart <= bud.getEnterAvg() && bud.getEnterAvg() <= venMax)
				vendorMatches.add(ven);
			if(ven.getCategory().equalsIgnoreCase("entertainer") && venStart <= bud.getEnterAvg() && bud.getEnterAvg() <= venMax)
				vendorMatches.add(ven);
			if(ven.getCategory().equalsIgnoreCase("jewelry") && venStart <= bud.getRingAvg() && bud.getRingAvg() <= venMax)
				vendorMatches.add(ven);
			if(ven.getCategory().equalsIgnoreCase("transpoartion") && venStart <= bud.getTransAvg() && bud.getTransAvg() <= venMax)
				vendorMatches.add(ven);
			if(ven.getCategory().equalsIgnoreCase("beauty") && venStart <= hmuMin && hmuMax <= venMax)
				vendorMatches.add(ven);
			if(ven.getCategory().equalsIgnoreCase("catering") && venStart <= caterMin & caterMax <= venMax)
				vendorMatches.add(ven);
			if(ven.getCategory().equalsIgnoreCase("reception venue") && venStart <= recepVenMin && recepVenMax <= venMax)
				vendorMatches.add(ven);
			if(ven.getCategory().equalsIgnoreCase("florist") && venStart <= bud.getFlowersAvg() && bud.getFlowersAvg() <= venMax)
				vendorMatches.add(ven);
			if(ven.getCategory().equalsIgnoreCase("videographer") && venStart <= bud.getPhotoAvg() && bud.getPhotoAvg() <= venMax)
				vendorMatches.add(ven);
			if(ven.getCategory().equalsIgnoreCase("officiant") && venStart <= offMin && offMax <= venMax)
				vendorMatches.add(ven);
			if(ven.getCategory().equalsIgnoreCase("dresses and attire") && venStart <= bud.getAttireAvg() && bud.getAttireAvg() <= venMax)
				vendorMatches.add(ven);



		}
		return vendorMatches;
		
		}
		
		return null;


	}

}
