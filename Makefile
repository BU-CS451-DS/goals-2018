# This is the Makefile helping you submit the labs.  
#     $ make [lab1|lab2|lab3a|lab3b|lab4a|lab4b]
COURSE=cs451
LABS=" lab1 lab2a lab2b lab2c lab3a lab3b lab4a lab4b"

%:
	@if echo $(LABS) | grep -q " $@ " ; then \
	    tar cvzf $@-handin.tar.gz --exclude=src/main/kjv12.txt Makefile .git src; \
                echo "Are you sure you want to submit $@? Enter 'yes' to continue:"; \
                read line; \
                if test $$line != "yes" ; then echo "Giving up submission"; exit; fi; \
                if test `stat -c "%s" "$@-handin.tar.gz" 2>/dev/null || stat -f "%z" "$@-handin.tar.gz"` -ge 20971520 ; then echo "File exceeds 20MB."; exit; fi; \
	        gsubmit $(COURSE) $@-handin.tar.gz; \
		gsubmit $(COURSE) -ls; \
        else \
            echo "Bad target $@. Usage: make [$(LABS)]"; \
        fi
