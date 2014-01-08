ActiveAdmin.register BikeReg do

  index do
    column :xyz_code        
    column :serial_number   
    column :color           
    column :brand           
    column :model           
    column :name            
    # column :alternate_name  
    column :city            
    column :state           
    column :country         
    column :primary_email   
    # column :second_email    
    # column :third_email     
    column :created_at      
    column :updated_at      

    default_actions
  end
  
end
