package mainTaskIO;
import java.io.*;
import java.util.Scanner;

public class Main {
	public static void main(String[] args) {
		//D:\3k1s
		//D:\3k1s\TPO\labs\lab6\mainTask\treeView.txt
		Scanner scanner = new Scanner(System.in);
		System.out.print("Путь к директории или текстовому файлу: ");
		String path = scanner.nextLine();
		scanner.close();
		File file = new File(path);
		
		if (file.exists() && file.isFile() && path.endsWith(".txt")) {
			ReadTextFile(file);
		} else if (file.exists() && file.isDirectory()) {
			CreateTreeStructure(file);
		} else {
			System.out.println("Указанный путь не является допустимым.");
		}
	}
	
	private static void ReadTextFile(File file) {
		try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
			String line;
			int folderCount = 0;
			int fileCount = 0;
			int totalFileLength = 0;
			
			while ((line = reader.readLine()) != null) {
				if (line.contains("|-----")) {
					folderCount++;
				} else if (!line.trim().isEmpty()) {
					fileCount++;
					totalFileLength += line.trim().length();
				}
			}
			double averageFilesPerFolder;
			if(folderCount == 0){
				averageFilesPerFolder = 0;
			}
			else{
				averageFilesPerFolder=(double) fileCount / folderCount;
			}
			double averageFileNameLength = (fileCount == 0) ? 0 : (double) totalFileLength / fileCount;
			
			System.out.println("Количество папок: " + folderCount);
			System.out.println("Количество файлов: " + fileCount);
			System.out.println("Среднее количество файлов в папке: " + averageFilesPerFolder);
			System.out.println("Средняя длина названия файла: " + averageFileNameLength);
		} catch (IOException e) {
			System.out.println("Ошибка при чтении файла: " + e.getMessage());
		}
	}
	
	private static void CreateTreeStructure(File directory) {
		try {
			FileWriter writer = new FileWriter("treeView.txt");
			writeTree(directory, "", writer);
			writer.close();
			System.out.println("Структура директории успешно записана в файл treeView.txt.");
		} catch (IOException e) {
			System.out.println("Ошибка при записи в файл: " + e.getMessage());
		}
	}
	
	private static void writeTree(File directory, String indent, FileWriter writer) throws IOException {
		writer.write(indent + directory.getName() + "\n");
		indent += "    |";
		
		File[] files = directory.listFiles();
		if (files != null) {
			for (File file : files) {
				if (file.isDirectory()) {
					writeTree(file, indent, writer);
				} else {
					writer.write(indent + "-----" + file.getName() + "\n");
				}
			}
		}
	}
}