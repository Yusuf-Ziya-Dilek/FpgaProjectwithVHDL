----------------------------------------------------------------------------------
-- Company: Bilkent University
-- Engineer: Yusuf Ziya Dilek
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity Distance_Calculation is
    Port ( clk : in STD_LOGIC;
           Calculation_reset : in STD_LOGIC;
           pulse : in STD_LOGIC;
           distance : out STD_LOGIC_VECTOR (8 downto 0));
end Distance_Calculation;

architecture Behavioral of Distance_Calculation is
    component Counter is 
        generic (n : POSITIVE := 10 ); -- Generic value will be used
        
        Port ( clk : in STD_LOGIC;
               enable : in STD_LOGIC;
               reset : in STD_LOGIC; -- active low
               counter_output : out STD_LOGIC_VECTOR (n - 1 downto 0));
    end component;
    
    Signal pulseWidth : std_logic_vector (21 downto 0);
begin
    CounterPulse : Counter generic map(22) port map(clk, pulse, not Calculation_reset, pulseWidth);
    
    Distance_calculation : process (pulse)
        variable Result : INTEGER;
        variable multiplier : std_logic_vector(23 downto 0);
        
        begin
            if (pulse = '0') then
                multiplier := pulseWidth * "11";
                Result := conv_integer(unsigned(multiplier(23 downto 13)));
                if (Result > 458) then
                    distance <= "111111111";
                else
                    distance <= std_logic_vector(conv_unsigned(Result, 9));  
                end if;
            end if;      
    end process Distance_calculation;
end Behavioral;



