package model;

import java.text.DecimalFormat;

public class Budget {
	private double  attireMin, attireMax, recepMin, recepMax, ceremonyMin, ceremonyMax, flowersMin,flowersMax,enterMin, enterMax, stationMin, stationMax, ringsMin,
	ringsMax, transMin, transMax, giftsMin, giftsMax, miscMin, miscMax, total, photoMin, photoMax;

	
//	AVGERAGES
	
	
	public double getAttireMin() {
		return attireMin;
	}

	public void setAttireMin(double attireMin) {
		this.attireMin = attireMin;
	}

	public double getAttireMax() {
		return attireMax;
	}

	public void setAttireMax(double attireMax) {
		this.attireMax = attireMax;
	}

	public double getRecepMin() {
		return recepMin;
	}

	public void setRecepMin(double recepMin) {
		this.recepMin = recepMin;
	}

	public double getRecepMax() {
		return recepMax;
	}

	public void setRecepMax(double recepMax) {
		this.recepMax = recepMax;
	}

	public double getCeremonyMin() {
		return ceremonyMin;
	}

	public void setCeremonyMin(double ceremonyMin) {
		this.ceremonyMin = ceremonyMin;
	}

	public double getCeremonyMax() {
		return ceremonyMax;
	}

	public void setCeremonyMax(double ceremonyMax) {
		this.ceremonyMax = ceremonyMax;
	}

	public double getFlowersMin() {
		return flowersMin;
	}

	public void setFlowersMin(double flowersMin) {
		this.flowersMin = flowersMin;
	}

	public double getFlowersMax() {
		return flowersMax;
	}

	public void setFlowersMax(double flowersMax) {
		this.flowersMax = flowersMax;
	}

	public double getEnterMin() {
		return enterMin;
	}

	public void setEnterMin(double enterMin) {
		this.enterMin = enterMin;
	}

	public double getEnterMax() {
		return enterMax;
	}

	public void setEnterMax(double enterMax) {
		this.enterMax = enterMax;
	}

	public double getStationMin() {
		return stationMin;
	}

	public void setStationMin(double stationMin) {
		this.stationMin = stationMin;
	}

	public double getStationMax() {
		return stationMax;
	}

	public void setStationMax(double stationMax) {
		this.stationMax = stationMax;
	}

	public double getRingsMin() {
		return ringsMin;
	}

	public void setRingsMin(double ringsMin) {
		this.ringsMin = ringsMin;
	}

	public double getRingsMax() {
		return ringsMax;
	}

	public void setRingsMax(double ringsMax) {
		this.ringsMax = ringsMax;
	}

	public double getTransMin() {
		return transMin;
	}

	public void setTransMin(double transMin) {
		this.transMin = transMin;
	}

	public double getTransMax() {
		return transMax;
	}

	public void setTransMax(double transMax) {
		this.transMax = transMax;
	}

	public double getGiftsMin() {
		return giftsMin;
	}

	public void setGiftsMin(double giftsMin) {
		this.giftsMin = giftsMin;
	}

	public double getGiftsMax() {
		return giftsMax;
	}

	public void setGiftsMax(double giftsMax) {
		this.giftsMax = giftsMax;
	}

	public double getMiscMin() {
		return miscMin;
	}

	public void setMiscMin(double miscMin) {
		this.miscMin = miscMin;
	}

	public double getMiscMax() {
		return miscMax;
	}

	public void setMiscMax(double miscMax) {
		this.miscMax = miscMax;
	}

	public double getPhotoMin() {
		return photoMin;
	}

	public void setPhotoMin(double photoMin) {
		this.photoMin = photoMin;
	}

	public double getPhotoMax() {
		return photoMax;
	}

	public void setPhotoMax(double photoMax) {
		this.photoMax = photoMax;
	}
	
	
	
	
	
	DecimalFormat format = new DecimalFormat(("#########.##"));
	
	
	
	
	public double getPhotoAvg() {
		
	    format.setParseBigDecimal(true);
		return  Double.parseDouble(format.format((getPhotoMin()+getPhotoMax()/2)));
	}

	public double getAttireAvg() {
	    format.setParseBigDecimal(true);
		return Double.parseDouble(format.format((attireMin+attireMax)/2));	}

	public double getRecepAvg() {
	    format.setParseBigDecimal(true);
		return Double.parseDouble(format.format((recepMin+recepMax)/2));	}

	public double getCeremonyAvg() {
	    format.setParseBigDecimal(true);
		return Double.parseDouble(format.format((ceremonyMin+ceremonyMax)/2));	}

	public double getFlowersAvg() {
	    format.setParseBigDecimal(true);
		return Double.parseDouble(format.format((flowersMin+flowersMax)/2));	}

	public double getEnterAvg() {
	    format.setParseBigDecimal(true);
		return Double.parseDouble(format.format((enterMin+enterMax)/2));	}

	public double getStationAvg() {
	    format.setParseBigDecimal(true);
		return Double.parseDouble(format.format((stationMin+stationMax)/2));	}

	public double getRingAvg() {
	    format.setParseBigDecimal(true);
		return Double.parseDouble(format.format((ringsMin+ringsMax)/2));	}

	public double getTransAvg() {
	    format.setParseBigDecimal(true);
		return Double.parseDouble(format.format((transMin+transMax)/2));	}

	public double getGiftsAvg() {
	    format.setParseBigDecimal(true);
		return Double.parseDouble(format.format((giftsMin+giftsMax)/2));	}

	public double getMiscAvg() {
	    format.setParseBigDecimal(true);
		return Double.parseDouble(format.format((miscMin+miscMax)/2));	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	
	
	
}
