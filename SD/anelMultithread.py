from Queue import Queue
from threading import Thread
import time

num_fetch_threads = 30
enclosure_queue = Queue()

fullText = "kivhconhsmleeaqbolsqyokxnfhzswuhzrgmhostxdguaqqkvvnkdtmuxknmeejngsaxwwdrgjnwyeid"

enclosure_queue.put(fullText)

def doTheWork(i, q):
    while True:
	print 'Thread %s:' % i
        text = q.get()
	if text.isupper():
		q.task_done()
		exit()
	pos=0
	letra=""
	for index,value in enumerate(text):
	   if not(value.isupper()):
	      pos=index
	      letra=value.upper()
	      break
	if pos == 0:
	   aux=letra+text[1:]
	else:
	   aux=text[:pos]+letra+text[pos+1:]
	text=aux
	print text + "\n"
	q.put(text)
        time.sleep(1)
        q.task_done()

print "palavra a ser processada = " + fullText + "\n"

for i in range(num_fetch_threads):
    worker = Thread(target=doTheWork, args=(i, enclosure_queue,))
    worker.setDaemon(True)
    worker.start()

enclosure_queue.join()
print '*** Done ***'
