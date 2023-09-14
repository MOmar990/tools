import tkinter as tk
from tkinter import messagebox, filedialog
import subprocess

# Function to run the Nmap scan
def run_scan():
    # Get the selected scan type
    scan_type = scan_type_var.get()

    # Get the user input for domain name or IP address
    target = target_entry.get()

    # Run the Nmap scan
    command = f"nmap {scan_type} {target}"
    try:
        output = subprocess.check_output(command, shell=True, text=True)
        scan_output_text.delete("1.0", tk.END)
        scan_output_text.insert(tk.END, output)
        if "filtered" in output or "blocked" in output:
            messagebox.showinfo("Scan Result", "The scan showed filtered ports or was blocked. Try an alternative scan method.")
    except subprocess.CalledProcessError as e:
        messagebox.showerror("Error", f"An error occurred while running the scan:\n{e}")

# Function to save the scan result
def save_result():
    result = scan_output_text.get("1.0", tk.END)

    # Prompt for the output directory
    output_dir = filedialog.askdirectory()

    # Prompt for the file name
    file_name = filedialog.asksaveasfilename(initialdir=output_dir, defaultextension=".txt")

    # Save the result to the selected file
    if file_name:
        try:
            with open(file_name, "w") as f:
                f.write(result)
            messagebox.showinfo("Save Result", "Scan result saved successfully.")
        except IOError:
            messagebox.showerror("Error", "An error occurred while saving the scan result.")
    else:
        messagebox.showinfo("Save Result", "Scan result not saved.")

# Create the main window
window = tk.Tk()
window.title("Nmap Scan Tool")

# Create a frame for the scan type selection
scan_type_frame = tk.Frame(window)
scan_type_frame.pack(pady=10)

# Label for scan type selection
scan_type_label = tk.Label(scan_type_frame, text="Select Scan Type:")
scan_type_label.pack(side=tk.LEFT)

# Scan type dropdown
scan_type_var = tk.StringVar(window)
scan_type_var.set("-sS")  # Default scan type

scan_type_dropdown = tk.OptionMenu(scan_type_frame, scan_type_var, "-sS", "-sT", "-sU", "-p-", "-sV")
scan_type_dropdown.pack(side=tk.LEFT)

# Frame for target selection
target_frame = tk.Frame(window)
target_frame.pack(pady=10)

# Label for target selection
target_label = tk.Label(target_frame, text="Enter Domain or IP Address:")
target_label.pack(side=tk.LEFT)

# Entry for target selection
target_entry = tk.Entry(target_frame, width=30)
target_entry.pack(side=tk.LEFT)

# Frame for buttons
button_frame = tk.Frame(window)
button_frame.pack(pady=10)

# Scan button
scan_button = tk.Button(button_frame, text="Run Scan", command=run_scan)
scan_button.pack(side=tk.LEFT)

# Save button
save_button = tk.Button(button_frame, text="Save Result", command=save_result)
save_button.pack(side=tk.LEFT)

# Frame for scan output
scan_output_frame = tk.Frame(window)
scan_output_frame.pack(pady=10)

# Label for scan output
scan_output_label = tk.Label(scan_output_frame, text="Scan Output:")
scan_output_label.pack()

# Text widget for scan output
scan_output_text = tk.Text(scan_output_frame, width=50, height=10)
scan_output_text.pack()

# Start the GUI event loop
window.mainloop()
