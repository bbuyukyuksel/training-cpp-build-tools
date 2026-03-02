import argparse
import glob
import os

def num_lines(fname: str) -> int:
    return sum(1 for _ in open(fname))

def main() -> None:
    parser = argparse.ArgumentParser(description="Count lines of code in a directory")
    parser.add_argument("--input_dir", help="Directory to search for source files", type=str, required=True)
    parser.add_argument("--output_file", help="Output file to write results", type=str, required=True)
    parser.add_argument("--extension", help="File extension to search for (e.g., .cpp)", nargs="?", type=str, default=".cpp")
    args = parser.parse_args()

    total_lines = 0
    for fname in glob.glob(f"{args.input_dir}/**/*{args.extension}", recursive=True):
        file_name = os.path.basename(fname)
        file_lines = num_lines(fname)
        print(f"Total lines of code: {file_name} = {file_lines}")
        total_lines += file_lines
    print(f"Total lines of code in directory {args.input_dir}: {total_lines}")
    with open(args.output_file, "w") as f:
        f.write(f"Total lines of code in directory {args.input_dir}: {total_lines}\n")

if __name__ == "__main__":
    main()
