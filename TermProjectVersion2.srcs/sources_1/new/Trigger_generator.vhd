library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Trigger_generator is
    Port ( clk : in STD_LOGIC;
           trigger : out STD_LOGIC);
end Trigger_generator;

architecture Behavioral of Trigger_generator is
    component Counter is 
        generic (n : POSITIVE := 10 ); -- Generic value will be used        
        Port ( clk : in STD_LOGIC;
               enable : in STD_LOGIC;
               reset : in STD_LOGIC; -- active low
               counter_output : out STD_LOGIC_VECTOR (n - 1 downto 0));
    end component;
    
    Signal resetCounter : std_logic;
    Signal outputCounter : std_logic_vector (23 downto 0);
begin
    
    trigg : Counter generic map(24) port map(clk, '1', resetCounter, outputCounter);
    
    process (clk)
        -- 1/4hz = 250ms signal -- 50Mhz/4hz = 12500000 which equals to 101111101011110000100000 in binary
        constant ms250 : std_logic_vector (23 downto 0) := "101111101011110000100000";
        constant ms250And100us : std_logic_vector (23 downto 0) := "101111101100111110101000";
        
        begin
            -----------------------------------------------------------------------------------------
            if (outputCounter > ms250 and outputCounter < ms250And100us) then
                trigger <= '1';
            else
                trigger <= '0';     
            end if;
            -----------------------------------------------------------------------------------------
            if (outputCounter = ms250And100us and outputCounter = "XXXXXXXXXXXXXXXXXXXXXXXX") then
                resetCounter <= '0';
            else
                resetCounter <= '1';
            end if; 
            -----------------------------------------------------------------------------------------               
    end process;       
end Behavioral;





