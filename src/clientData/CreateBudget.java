package clientData;

import model.Budget;

public class CreateBudget {

	public Budget budget(double max){
		
		Budget budget = new Budget(); 
		

		//		PHOTOGRAPHY AND VIDEOGRAPHY
		budget.setPhotoMin((max*.10));
		budget.setPhotoMax((max*.13));

		//		 DRESSES AND ATTIRE
		budget.setAttireMin((max*.07));
		budget.setAttireMax((max*.09));

		//		 RINGS
		budget.setRingsMin((max*.07));
		budget.setRingsMax((max*.09));

		//		 ENTERAINMENT
		budget.setEnterMin((max*.02));
		budget.setEnterMax((max*.04));

		//		 GIFTS
		budget.setGiftsMin((max*.02));
		budget.setGiftsMax((max*.03));

		//		 TRANSPORTATION
		budget.setTransMin((max*.02));
		budget.setTransMax((max*.04));

		//		 RECEPTION
		budget.setRecepMin((max*.45));
		budget.setRecepMax((max*.50));

		//		 CEREMONY
		budget.setCeremonyMin((max*.02));
		budget.setCeremonyMax((max*.03));

		//		 FLOWERS
		budget.setFlowersMin((max*.05));
		budget.setFlowersMax((max*.08));

		//		 STATIONARY
		budget.setStationMin((max*.02));
		budget.setStationMax((max*.03));

		//		MISC
		budget.setMiscMin((max*.05));
		budget.setMiscMax((max*.06));

		budget.setTotal(max);
		
		return budget;
	}


}
