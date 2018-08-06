module LecturesHelper
    
    def make_star(point)
        if point == 1
            "★"
        elsif point == 2
            "★★"
        elsif point == 3
            "★★★"
        elsif point == 4
            "★★★★"
        elsif point == 5
            "★★★★★"
        end
    end
end
