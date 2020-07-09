package main

import (
	"fmt"
	"os/exec"
	"strings"

	"github.com/eiannone/keyboard"
	"github.com/maxmclau/gput"
)

func getBranchList() ([]string, string) {
	output1, _ := exec.Command("bash", "-c", "git for-each-ref --format=\"%(refname:short)\" refs/heads").CombinedOutput()
	branchArray := strings.Split(strings.TrimSpace(string(output1)), "\n")
	output2, _ := exec.Command("bash", "-c", "git symbolic-ref --short HEAD").CombinedOutput()
	currentBranch := strings.TrimSpace(string(output2))
	return branchArray, currentBranch
}

func branchShow(currentIndex int) ([]string, int, string) {
	branchArray, currentBranch := getBranchList()
	for i, value := range branchArray {
		if currentIndex < 0 {
			if value == currentBranch {
				currentIndex = i
				currentBranch = value
				fmt.Printf("\033[31m%s\033[0m\n", value)
			} else {
				fmt.Printf("%s\n", value)
			}
		} else {
			if i == currentIndex {
				currentBranch = value
				fmt.Printf("\033[31m%s\033[0m\n", value)
			} else {
				fmt.Printf("%s\n", value)
			}
		}
	}
	return branchArray, currentIndex, currentBranch
}

func main() {
	// os.Chdir("/home/lewis/Public/WorkPro/ihr360-kpi")
	gput.Civis()
	gput.Sc()
	branchArray, currentIndex, currentBranch := branchShow(-1)

	keysEvents, err := keyboard.GetKeys(10)
	if err != nil {
		panic(err)
	}
	defer func() {
		_ = keyboard.Close()
	}()
	for {
		event := <-keysEvents
		if event.Err != nil {
			panic(event.Err)
		}
		switch event.Key {
		case keyboard.KeyArrowUp:
			if currentIndex > 0 {
				currentIndex--
			}
			gput.Rc()
			branchArray, currentIndex, currentBranch = branchShow(currentIndex)
			break
		case keyboard.KeyArrowDown:
			if currentIndex < len(branchArray)-1 {
				currentIndex++
			}
			gput.Rc()
			branchArray, currentIndex, currentBranch = branchShow(currentIndex)
			break
		case keyboard.KeyEnter:
			err := exec.Command("bash", "-c", "git checkout "+currentBranch).Run()
			if err != nil {
				fmt.Println(err.Error())
			}
			return
		case keyboard.KeyEsc:
			return
		default:
			break
		}
	}
}
