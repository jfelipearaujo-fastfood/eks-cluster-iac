# resource "aws_autoscaling_policy" "cpu_up" {
#   name            = format("%s-nodes-cpu-scale-up", var.cluster_name)
#   adjustment_type = "ChangeInCapacity"

#   cooldown           = var.auto_scale_cpu_up.cooldown
#   scaling_adjustment = var.auto_scale_cpu_up.scaling_adjustment

#   autoscaling_group_name = aws_eks_node_group.cluster.resources[0].autoscaling_groups[0].name
# }

# resource "aws_cloudwatch_metric_alarm" "cpu_up" {

#   alarm_name = format("%s-nodes-cpu-high", var.cluster_name)

#   comparison_operator = "GreaterThanOrEqualToThreshold"
#   metric_name         = "CPUUtilization"
#   namespace           = "AWS/EC2"
#   statistic           = "Average"

#   evaluation_periods = var.auto_scale_cpu_up.evaluation_periods
#   period             = var.auto_scale_cpu_up.period
#   threshold          = var.auto_scale_cpu_up.threshold

#   dimensions = {
#     AutoScalingGroupName = aws_eks_node_group.cluster.resources[0].autoscaling_groups[0].name
#   }

#   alarm_actions = [aws_autoscaling_policy.cpu_up.arn]
# }

# resource "aws_autoscaling_policy" "cpu_down" {
#   name            = format("%s-nodes-cpu-scale-down", var.cluster_name)
#   adjustment_type = "ChangeInCapacity"

#   cooldown           = var.auto_scale_cpu_down.cooldown
#   scaling_adjustment = var.auto_scale_cpu_down.scaling_adjustment

#   autoscaling_group_name = aws_eks_node_group.cluster.resources[0].autoscaling_groups[0].name
# }

# resource "aws_cloudwatch_metric_alarm" "cpu_down" {

#   alarm_name = format("%s-nodes-cpu-low", var.cluster_name)

#   comparison_operator = "LessThanOrEqualToThreshold"
#   metric_name         = "CPUUtilization"
#   namespace           = "AWS/EC2"
#   statistic           = "Average"

#   evaluation_periods = var.auto_scale_cpu_down.evaluation_periods
#   period             = var.auto_scale_cpu_down.period
#   threshold          = var.auto_scale_cpu_down.threshold

#   dimensions = {
#     AutoScalingGroupName = aws_eks_node_group.cluster.resources[0].autoscaling_groups[0].name
#   }

#   alarm_actions = [aws_autoscaling_policy.cpu_down.arn]
# }
