 /*
        1
        1 2
        1 2 3
        1 2 3 4
        1 2 3 4 5  */

  /*

    module pattern;

               integer i,j;

                        initial
                            begin
                                           for(i=1;i<=5;i=i+1)
                                              begin
                                                           for(j=1;j<=i;j=j+1)
                                                             begin
                                                                           $write("%0d",j);
                                                                 end

                                                         $display(" ");
                                                  end

                                end
        endmodule  */



        /* 1
           0 1
           1 0 1
           0 1 0 1
           1 0 1 0 1
           0 1 0 1 0 1 */

         /*  module tb;
                  integer i,j;

                                  initial
                                      begin
                                                    for(i = 0;i<=5;i=i+1)
                                                          begin
                                                       begin
                                                                        for(j=0;j<=i;j=j+1)
                                                                          begin
                                                                                    if((i+j)%2 == 0)
                                                                                       $write("%0d",0);
                                                                                        else
                                                                                           $write("%0d",1);
                                                                          end

                                                                        $display(" ");
                                                          end

                                          end

           endmodule  */

    /*
       1
           1 1
       1 1 1
       1 1 1 1
           1 1 1 1 1 */

/*
   module pattern;
           integer i,j;

                        initial
                            begin
                                          for(i=0;i<=4;i=i+1)
                                             begin
                                                          for(j=0;j<=i;j=j+1)
                                                             begin
                                                                            $write(1);
                                                                 end

                                                   $display(" ");
                                                 end
                                end
   endmodule */


        /*
                1
                2 2
                3 3 3
                4 4 4 4
                5 5 5 5 5 */

        /*      module tb;
                     integer i,j;

                          initial
                              begin
                                                for(i=1;i<=5;i=i+1)
                                                   begin
                                                             for(j=1;j<=i;j=j+1)
                                                                   begin
                                                                             $write(i);
                                                                   end

                                                                   $display(" ");
                                                                 //$write(" \n ");
                                                   end

                                  end
                endmodule
         */




   /*
          0
          1 2
          3 4 5           // for this take extra variable
          6 7 8 9  */

        /* module pattern;

                   integer i,j;
                   integer num =0;

                                initial
                                   begin
                                                 for(i=0;i<=5;i=i+1)
                                                    begin
                                                                 for(j=0;j<=i;j=j+1)
                                                                   begin
                                                                              $write(num);
                                                                                  num = num + 1;
                                                                   end
                                                                 end

                                                                   $display(" ");
                                                        end

                                   end
          endmodule  */

  /*    1  2  3  4  5
                6  7  8  9
                10 11 12          need to see this problem
                13 14
                15           */

/*              module pattern;

                   integer i,j;


                                initial
                                   begin
                                   for(i=1;i<=5;i=i+1)
                                                    begin
                                                                 for(j=1;j<=5-i;j=j+1)
                                                                   begin
                                                                              $write(j);
                                                                                
                                                                   end

                                                                   $display(" ");
                                                                   
                                                        end

                                   end
          endmodule

*/
  /*
         * * * *
         * * * *
         * * * *
         * * * *  */
/*
        module pattern;
                integer i,j;
                
                        initial
                           begin
                                         for(i=0;i<=3;i=i+1)
                                          begin
                                                   for(j=0;j<=3;j=j+1)
                                                     begin
                                                                   $write("*");
                                                         end

                                                        $display(" ");
                                          end
                           end
        endmodule   */


/*
  * * * * *
  * * * *
  * * *
  * *
  *            */

module pattern;
                integer i,j;

                        initial
                           begin
                                         for(i=0;i<=5;i=i+1)
                                          begin
                                                   for(j=0;j<=5-i;j=j+1)
                                                     begin
                                                                   $write("*");
                                                         end

                                                        $display(" ");
                                          end
                           end
        endmodule   */

 /*
         0
       0 0
     0 0 0
   0 0 0 0   */

/*
   module pattern;
           integer i,j;
           integer num;
           integer n=4;

                        initial
                            begin
                                          for(i=1;i<=n;i=i+1)
                                             begin
                                                          for(j=1;j<=n;j=j+1)
                                                             begin
                                                                   num = n-j;
                                                                   repeat(num)
                                                                     begin
                                                                    $write(" ");   
                                                                    //need to check this logic
                                                                     //need to check this logic
                                                                     end
                                                                   repeat(j)
                                                                     begin
                                                                     $write("%0d ",0);
                                                                      end
                                                             end


                                                                 $display(" ");
                                                 end
                                end
   endmodule */


  /*
         0               // first in the column loop do print the spaces
       0 0               // second print the values in the remaining
     0 0 0
   0 0 0 0   */

/*
 module pattern;
           integer i,j,k;
           integer n=4;

                   initial
                            begin
                                          for(i=1;i<=n;i=i+1)
                                             begin
                                                          for(j=n-i;j>0;j=j-1)
                                                             begin
                                                                   $write(" ");
                                                             end

                                                           for(k=1;k<=i;k=k+1)
                                                                 begin
                                                                   $write("%0d",0);
                                                             end
                                                             
                                                                 $display(" ");
                                                 end
                                end
   endmodule
        */

/*
        *
      * * *
    * * * * *
  * * * * * * *   */
/* module tb;
         integer i,j,k;
         integer n=4;

         initial
              begin
                    for(i=1;i<=n;i=i+1)
                      begin
                            for(j=1;j<=2*n-1;j=j+1)
                                begin
                                       if(j >= n-(i-1) && j <= n+(i-1))
                                             $write("*");
                                       else
                                            $write(" ");
                                end

                                $display();
                     end
              end
       endmodule
*/


/*/*
        0
      0 0
    0 0 0
  0 0 0 0    // first create this triangle
    0 0 0    // second create this triangle
      0 0    // join both traingles
        0

             */

   module pattern;
          integer i,j,k,m,l;
          integer n=4;

          initial
            begin

                                          for(i=1;i<=n;i=i+1)
                                             begin
 for(j=n-i;j>0;j=j-1)
                                                             begin
                                                                   $write(" ");
                                                             end

                                                           for(k=1;k<=i;k=k+1)
                                                                 begin
                                                                   $write("%0d",0);
                                                             end



                                                                 $display(" ");
                                                 end
                                          for(k=3;k>0;k=k-1) // for the second loop rows
                                             begin
                                                          for(m=n-k;m>0;m=m-1)
                                                             begin
                                                                   $write(" ");
                                                             end

                                                           for(l=1;l<=k;l=l+1)
                                                                 begin
                                                                   $write("%0d",0);
                                                             end
                                               

                                                                 $display(" ");
                                                 end



            end

   endmodule





/*\

/*
#   *
#  ***
# *****
# *****
#  ***
#   *

module tb;
         integer i,j;

         initial
              begin
                    for(i=1;i<=3;i=i+1)
                      begin
                          for(j=1;j<=5;j=j+1)
                              begin
                                if(j>=3-(i-1) && j<=3+(i-1))
                                        $write("*");
                                else
                                        $write(" ");

                              end
                              $display();

                        end

                     for(i=3;i>=1;i=i-1)
                      begin
                          for(j=5;j>=1;j=j-1)
                              begin
                                if(j>=3-(i-1) && j<=3+(i-1))
                                        $write("*");
                                else
                                        $write(" ");

                              end
                              $display();

                        end

              end
endmodule */


    /*   1
      1 2
     1 2 3
    1 2 3 4 */

/*module tb;
         integer i,j,k;

         initial
              begin
                    for(i=1;i<=5;i=i+1)
                      begin
                               for(k=i;k<=5;k=k+1)
                                        $write(" ");

                 for(j=1;j<=i;j=j+1) begin
                                $write("%0d ",j);
                        end
                              $display("");
                      end

              end
       endmodule


 */


                                        




                     

                                                              295,1 
                                             
                          
                                                            


                                                      
                       

                                            
                                                            
                                





