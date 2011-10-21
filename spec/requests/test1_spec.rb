    require 'spec_helper'  
      
    describe "Test1" do  
      describe "GET /test1 index" do  
        it "works! (now write some real specs)" do  
          get test1_index_path  
          response.status.should be(200)  
        end  
      end  
    end  