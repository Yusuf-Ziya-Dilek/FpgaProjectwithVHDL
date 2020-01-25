-- Engineer : Yusuf Ziya Dilek
-- This module decodes a four bit binary number into seven segment display notation

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Start of the Decoder Module
entity segDecoder is
    Port ( dig4Bit : in STD_LOGIC_VECTOR (3 downto 0);
           lowSegA : out STD_LOGIC;
           lowSegB : out STD_LOGIC;
           lowSegC : out STD_LOGIC;
           lowSegD : out STD_LOGIC;
           lowSegE : out STD_LOGIC;
           lowSegF : out STD_LOGIC;
           lowSegG : out STD_LOGIC);
end segDecoder;

architecture Behavioral of segDecoder is

begin
    --Start of decoding process
    PROCESS (dig4Bit)
        variable decDataTemp : std_logic_vector(6 downto 0);--Decoding variable
        begin
            -- Decoding 4 bit data into seven segment display form with Case
            CASE dig4Bit is
                when "0000" => decDataTemp := "1111110"; -- Zero
                when "0001" => decDataTemp := "0110000"; -- One
                when "0010" => decDataTemp := "1101101"; -- Two
                when "0011" => decDataTemp := "1111001"; -- Three
                when "0100" => decDataTemp := "0110011"; -- Four
                when "0101" => decDataTemp := "1011011"; -- Five
                when "0110" => decDataTemp := "1011111"; -- Six
                when "0111" => decDataTemp := "1110000"; -- Seven
                when "1000" => decDataTemp := "1111111"; -- Eight
                when "1001" => decDataTemp := "1111011"; -- Nine
                when "1010" => decDataTemp := "1110111"; -- Ten (A)
                when "1011" => decDataTemp := "0011111"; -- Eleven (B)
                when "1100" => decDataTemp := "1001110"; -- Twelve (C)
                when "1101" => decDataTemp := "0111101"; -- Thirteen (D)
                when "1110" => decDataTemp := "1001111"; -- Fourtenn (E)
                when "1111" => decDataTemp := "1000111"; -- Fifteen (F)
                when others => decDataTemp := "0111110"; -- Error (H)
            end case;
            
            -- Assigning complement of decoded data array into related seven segment outputs
            lowSegA <= not decDataTemp(6);
            lowSegB <= not decDataTemp(5);
            lowSegC <= not decDataTemp(4);
            lowSegD <= not decDataTemp(3);
            lowSegE <= not decDataTemp(2);
            lowSegF <= not decDataTemp(1);
            lowSegG <= not decDataTemp(0);
                        
    end process; -- End of the Decoding Process                            

end Behavioral; -- End of the Module
