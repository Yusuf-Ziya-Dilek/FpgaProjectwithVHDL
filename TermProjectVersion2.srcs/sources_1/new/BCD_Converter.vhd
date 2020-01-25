library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity BCD_Converter is
    Port ( Distance_inputs : in STD_LOGIC_VECTOR(8 downto 0);
           hundreds : out STD_LOGIC_VECTOR (3 downto 0);
           tens : out STD_LOGIC_VECTOR (3 downto 0);
           unit : out STD_LOGIC_VECTOR (3 downto 0));
end BCD_Converter;

architecture Behavioral of BCD_Converter is

begin
    process(Distance_inputs)
    variable i : integer := 0;
    variable bcd : std_logic_vector(20 downto 0);
    begin
        --Initialziation phase
        bcd := (others => '0');
        bcd(8 downto 0) := Distance_inputs;
        --Double - dabble algorithm
        for i in 0 to 8 loop
            bcd(19 downto 0) := bcd(18 downto 0) & '0'; -- Left shift one bit
            
            if (i < 8 and bcd(12 downto 9) > "0100") then
                bcd(12 downto 9) :=  bcd(12 downto 9) + "0011";
            end if;
            
            if (i < 8 and bcd(16 downto 13) > "0100") then
                bcd(16 downto 13) :=  bcd(16 downto 13) + "0011";
            end if; 
            
            if (i < 8 and bcd(20 downto 17) > "0100") then
                bcd(20 downto 17) :=  bcd(20 downto 17) + "0011";
            end if; 
            
         end loop;   
         
         -- three bcd numbers to outputs
                     
         hundreds <= bcd(20 downto 17);
         tens   <= bcd(16 downto 13);
         unit   <= bcd(12 downto 9);             
        
    end process;    
        
        

end Behavioral;
