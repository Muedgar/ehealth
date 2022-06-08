/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author mutanganaedgar
 */
public class getHealthInfo {
    double bmi = 0.0;
    double height = 0.0;
    int weight = 0;
    Double newWeight = 0.0;
    String healthCondition = "";
    
   
    public getHealthInfo(double height, int weight) {
        this.height = height;
        this.weight = weight;
        this.newWeight = Double.valueOf(weight);
        
        this.bmi = (this.newWeight)/(this.height*this.height);
         
                            if(this.bmi<18.5) {
                                this.healthCondition = "Underweight";
                            }
                            if(18.5<=this.bmi && this.bmi<25.0) {
                                this.healthCondition = "Normal";
                            }
                            if(25.0<=this.bmi && this.bmi<30.0) {
                                this.healthCondition = "Overweight";
                            }
                            if(this.bmi>=30.0) {
                                this.healthCondition = "Obese";
                            }
    }
    
   public double getBMI() {
       return this.bmi;
   }
    public String getHealth() {
        return this.healthCondition;
    }                        
}


