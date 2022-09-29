import shutil, os

FOLDERS = [
	'',
]

def	join_segments(folder):
	ts_filenames = os.listdir(folder)
	with open(f'{folder}.mp4', 'wb') as merged:
		for ts_file in ts_filenames:
			path = os.path.join(folder, ts_file)
			with open(path, 'rb') as mergefile:
				shutil.copyfileobj(mergefile, merged)


if __name__ == '__main__':
	for folder in FOLDERS:
		join_segments(folder)

