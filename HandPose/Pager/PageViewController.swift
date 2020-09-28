import UIKit

class PageViewController: UIPageViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setViewControllers([getFirst()], direction: .forward, animated: true, completion: nil)
        self.dataSource = self
    }
    
    private func getFirst() -> FirstViewController {
        return storyboard!.instantiateViewController(identifier: "FirstViewController") as FirstViewController
    }
    
    private func getSecond() -> SecondViewController {
        return storyboard!.instantiateViewController(identifier: "SecondViewController") as SecondViewController
    }
    
    private func getThird() -> ThirdViewController {
        return storyboard!.instantiateViewController(identifier: "ThirdViewController") as ThirdViewController
    }
}

extension PageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if viewController.isKind(of: ThirdViewController.self) {
            return getSecond()
        } else if viewController.isKind(of: SecondViewController.self) {
            return getFirst()
        } else {
            return nil
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if viewController.isKind(of: FirstViewController.self) {
            return getSecond()
        } else if viewController.isKind(of: SecondViewController.self) {
            return getThird()
        } else {
            return nil
        }
    }
}
